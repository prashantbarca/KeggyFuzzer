require 'spec_helper'
require 'hammer-parser'

shared_examples "shared stuff1" do
  before do  
    @hammer = Hammer::Parser
  end
end

describe KeggyFuzzer do
  include_context 'shared stuff1'
  it 'check ch_range' do
    parser = @hammer.ch_range('a', 'z')
    fuzz = KeggyFuzzer::KeggyFuzzer.new(parser, 10)
    expect(fuzz.test_parsers).to be true
  end
  it 'check middle' do
    parser = @hammer.middle(@hammer.token('abcd'),
                            @hammer.ch_range('a', 'z'),
                            @hammer.token('abcd'))
    fuzz = KeggyFuzzer::KeggyFuzzer.new(parser, 10)
    expect(fuzz.test_parsers).to be true
  end
  it 'check optional' do
    parser = @hammer.optional(@hammer.ch_range('a', 'z'))
    fuzz = KeggyFuzzer::KeggyFuzzer.new(parser, 10)
    expect(fuzz.test_parsers).to be true
  end
  it 'check in' do
    parser = @hammer.in("abcd")
    fuzz = KeggyFuzzer::KeggyFuzzer.new(parser, 10)
    expect(fuzz.test_parsers).to be true
  end
  it 'check many' do
    parser = @hammer.many(@hammer.ch('a'))
    fuzz = KeggyFuzzer::KeggyFuzzer.new(parser, 10)
    expect(fuzz.test_parsers).to be true
  end
  it 'check many1' do
    parser = @hammer.many1(@hammer.ch('a'))
    fuzz = KeggyFuzzer::KeggyFuzzer.new(parser, 10)
    expect(fuzz.test_parsers).to be true
  end
  it 'check ch' do
    parser = @hammer.ch('a')
    fuzz = KeggyFuzzer::KeggyFuzzer.new(parser, 10)
    expect(fuzz.test_parsers).to be true
  end
  it 'check token' do
    parser = @hammer.token('abcd')
    fuzz = KeggyFuzzer::KeggyFuzzer.new(parser, 10)
    expect(fuzz.test_parsers).to be true
  end
end
