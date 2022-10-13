def suma_factorial(n)
    for a in 1..n do
        for b in 1..n do
            if n-1 < 1
                print b
            else
                print "#{b} + "
            end
        end
        puts
        n-=1
    end
end

suma_factorial(10)