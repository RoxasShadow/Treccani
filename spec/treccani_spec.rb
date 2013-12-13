#! /usr/bin/env ruby
require 'treccani'

describe Treccani do
  it 'gets the daily quote and its author' do
    expect {
      trec = Treccani::Citazione.new.get
      trec[:citazione].length.should > 2
      trec[:autore].length.should    > 2
    }.to_not raise_error
  end

  it 'gets the lemma and the meanings of the given term from Enciclopedia' do
    expect {
      trec = Treccani::Enciclopedia.new.get 'insegnare'
      trec[:lemma].length.should          > 2
      trec[:meanings].first.length.should > 2
      trec[:meaning].length.should        > 2
    }.to_not raise_error
  end

  it 'gets the synonyms of the given term' do
    expect {
      trec = Treccani::Sinonimi.new.get 'insegnare'
      trec.length.should > 2
    }.to_not raise_error
  end

  it 'gets the lemma and the meanings of the given term from Vocabolario' do
    expect {
      trec = Treccani::Vocabolario.new.get 'insegnare'
      trec[:lemma].length.should          > 2
      trec[:meanings].first.length.should > 2
    }.to_not raise_error
  end
end