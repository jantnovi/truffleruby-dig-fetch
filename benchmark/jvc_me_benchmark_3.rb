require 'benchmark/ips'

thing = {
    :foo => {
        :bar => {       
            :foobar => "foobar"
        }
    }
}

Benchmark.ips do |x|
  x.iterations = 3

  x.report("digging") do
    thing.dig(:foo, :bar, :foobar)
  end

  x.report("fetch chaining") do
    thing.fetch(:foo).fetch(:bar).fetch(:foobar)
  end

  x.report("dig fetching") do
    thing.dig_fetch(:foo, :bar, :foobar)
  end
end