require "pry"
class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  def valid? 
    @sender.valid? && @receiver.valid? 
  end 
  
  def execute_transaction
    if @sender.balance < @amount && @status == "pending"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      # binding.pry 
    end
  end
  
    def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end

# amanda.balance).to eq(950)
#       expect(avi.balance).to eq(1050)
#       expect(transfer.status