class TitleBracketsValidator < ActiveModel::Validator
  attr_reader :record, :brackets_hash
  attr_accessor :errors

  def validate(record)
    @errors = []
    @record = record
    @brackets_hash  = { '(' => ')', '[' => ']', '{' => '}' }

    not_closed
    empty
    misplaced
    
    record.errors.add(:title, errors) if errors.any?
  end

  private

  def not_closed
    counter = 0
    brackets_hash.each do |k, v|
      counter += record.title.count(k) + record.title.count(v)
    end
    errors << 'brackets not closed' if !counter.even?
  end

  def empty
    errors << 'brackets can\'t be empty' if !brackets_hash.none? { |k, v| record.title.delete(' ').include?( "#{k}#{v}" ) }
  end

  def misplaced
    stack = []
    left, right = brackets_hash.keys, brackets_hash.values
    record.title.each_char do |char|
      if left.include? char
        stack << char
      elsif right.include? char
        errors << 'brackets misplaced' if stack.empty? || (brackets_hash[stack.pop] != char)
      end
    end
  end
end
