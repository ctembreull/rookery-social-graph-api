class TestClass
  CONST_NONE = 0
  CONST_ALL  = 1

  def test(n)
    puts 'none' if n == CONST_NONE
    puts 'all'  if n == CONST_ALL
  end

end
