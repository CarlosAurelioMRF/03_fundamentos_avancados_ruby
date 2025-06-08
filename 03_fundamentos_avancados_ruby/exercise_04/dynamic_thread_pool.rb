require 'thread'

class PriorityQueue
  PRIORITIES = [:high, :medium, :low]

  def initialize
    @queues = PRIORITIES.map { |priority| [priority, Queue.new] }.to_h
    @mutex = Mutex.new
  end

  def push(task, priority = :medium)
    raise "Prioridade inválida" unless PRIORITIES.include?(priority)
    @queues[priority] << task
  end

  def pop
    @mutex.synchronize do
      PRIORITIES.each do |priority|
        return @queues[priority].pop(true) rescue ThreadError
      end
    end
    nil
  end

  def empty?
    @queues.values.all?(&:empty?)
  end
end

class DynamicThreadPool
  def initialize(min_threads: 2, max_threads: 10)
    @min_threads = min_threads
    @max_threads = max_threads
    @queue = PriorityQueue.new
    @threads = []
    @mutex = Mutex.new
    @shutdown = false

    min_threads.times { spawn_thread }
  end

  def schedule(priority = :medium, &block)
    @queue.push(block, priority)
    maybe_spawn_thread
  end

  def shutdown
    @shutdown = true
    @threads.each(&:join)
  end

  private

  def maybe_spawn_thread
    @mutex.synchronize do
      alive_threads = @threads.select(&:alive?)

      if alive_threads.size < @max_threads
        spawn_thread
      end

      @threads.reject! { |t| !t.alive? }
    end
  end

  def spawn_thread
    thread = Thread.new do
      loop do
        break if @shutdown && @queue.empty?

        task = @queue.pop rescue nil
        task&.call
      end
    end

    @threads << thread
  end
end

pool = DynamicThreadPool.new(max_threads: 3)

10.times do |i|
  pool.schedule { sleep 1; puts "Tarefa padrão #{i} concluída" }
end

5.times do |i|
  pool.schedule(:high) { sleep 0.5; puts "Tarefa prioritária #{i} concluída" }
end

pool.shutdown # => termina a execução de todas as Threads