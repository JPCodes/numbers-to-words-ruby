require('rspec')
require('numbers_to_words')

describe('Fixnum#numbers_to_words') do

  it('displays a word for a number below 20') do
    expect(2.numbers_to_words()).to(eq('two '))
  end

  it('displays a word for a number below 20') do
    expect(19.numbers_to_words()).to(eq('nineteen '))
  end

  it('displays a word for a number below 100') do
    expect(49.numbers_to_words()).to(eq('forty nine '))
  end

  it('displays a word for a number between 100 and 199') do
    expect(154.numbers_to_words()).to(eq('onehundredfiftyfour'))
  end

end
