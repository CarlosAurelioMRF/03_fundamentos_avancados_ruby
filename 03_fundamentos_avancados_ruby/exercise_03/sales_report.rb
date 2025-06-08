class SalesReport
  def initialize(sales_data)
    @sales_data = sales_data
  end

  def total_by_category
    total_sales = Hash.new(0)

    @sales_data.each do |sale|
      category = sale[:category]
      amount = sale[:amount]
      total_sales[category] += amount
    end

    total_sales
  end

  def top_sales(quantity)
    sorted_sales = @sales_data.sort_by { |sale| -sale[:amount] }
    sorted_sales.first(quantity)
  end

  def grouped_by_category
    grouped_sales = @sales_data.group_by { |sale| sale[:category] }
    grouped_sales.transform_values do |sales|
      sales.map { |sale| { product: sale[:product], amount: sale[:amount] } }
    end
  end

  def above_average_sales
    total_amount = @sales_data.sum { |sale| sale[:amount] }
    average_amount = total_amount / @sales_data.size.to_f

    @sales_data.select { |sale| sale[:amount] > average_amount }
  end
end

# Example usage:
sales_data = [
  { product: "Notebook", category: "Eletrônicos", amount: 3000 },
  { product: "Celular", category: "Eletrônicos", amount: 1500 },
  { product: "Cadeira", category: "Móveis", amount: 500 },
  { product: "Mesa", category: "Móveis", amount: 1200 },
  { product: "Headphone", category: "Eletrônicos", amount: 300 },
  { product: "Armário", category: "Móveis", amount: 800 }
]

report = SalesReport.new(sales_data)
puts report.total_by_category
puts report.top_sales(3)
puts report.grouped_by_category
puts report.above_average_sales