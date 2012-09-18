class CartesianProduct
  include Enumerable

  def initialize(*arrays)
    @arrays = arrays.reverse
    @num_elements = @arrays.inject(1){ |accum, item| accum *= item.length }
  end

  def count
    @num_elements
  end

  def each(start_index=0, stop_index=-1)
    start_index = @num_elements + start_index if start_index < 0
    stop_index = @num_elements + stop_index + 1 if stop_index < 0
    (start_index...stop_index).each { |index| yield(index_to_item(index)) }
  end

  protected

  def index_to_item(index)
    @arrays.map do |array|
      element = array[index % array.length]
      index /= array.length
      element
    end.reverse
  end

end
