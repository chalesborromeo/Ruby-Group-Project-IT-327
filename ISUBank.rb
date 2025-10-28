class Account
  attr_reader :name, :balance

  def initialize(name, pin, balance = 0.0)
    @name = name
    @pin = pin
    @balance = balance.to_f
    puts "Hello #{@name}! Welcome to ISU Banking System!"
  end

  def authenticate?(pin_number)
    pin_number.to_s == @pin.to_s
  end

  def display_balance
    puts "Balance for #{@name}: $#{'%.2f' % @balance}"
  end

  def deposit(amount)
    amount = amount.to_f
    raise ArgumentError, "Deposit must be positive." unless amount > 0
    @balance += amount
    puts "Deposited $#{'%.2f' % amount}. New balance: $#{'%.2f' % @balance}."
  end

  def withdraw(amount)
    amount = amount.to_f
    raise ArgumentError, "Withdrawal must be positive." unless amount > 0
    raise StandardError, "Insufficient funds." if amount > @balance
    @balance -= amount
    puts "Withdrew $#{'%.2f' % amount}. New balance: $#{'%.2f' % @balance}."
  end

  def to_h
    { name: @name, balance: @balance }
  end
end

class Bank
  def initialize
    # "Database" of accounts: key = account holder name (downcased), value = Account
    @accounts = {}
  end

  def add_account(name, pin, balance = 0.0)
    key = name.downcase.strip
    raise StandardError, "Account already exists." if @accounts.key?(key)
    @accounts[key] = Account.new(name.strip, pin, balance)
  end

  def find_account(name)
    @accounts[name.downcase.strip]
  end

  def list_accounts
    @accounts.values
  end

  def print_report!(path = nil)
    path ||= "bank_report_#{Time.now.strftime('%Y%m%d_%H%M%S')}.txt"
    File.open(path, "w") do |f|
      f.puts "ISU BANK ACCOUNT REPORT"
      f.puts "Generated: #{Time.now}"
      f.puts "-" * 40
      list_accounts.each do |acct|
        f.puts "#{acct.name.ljust(20)} Balance: $#{'%.2f' % acct.balance}"
      end
      f.puts "-" * 40
      total = list_accounts.map(&:balance).sum
      f.puts "TOTAL FUNDS: $#{'%.2f' % total}"
    end
    puts "Report written to #{path}"
  end
end

# ---------- CLI ----------
def prompt(msg)
  print msg
  gets&.chomp
end

def prompt_amount(label)
  amt = prompt("#{label} amount: $")
  Float(amt)
rescue
  puts "Please enter a valid number."
  retry
end

bank = Bank.new

loop do
  puts "\n=== ISU Banking System ==="
  puts "1) Create account"
  puts "2) View account balance"
  puts "3) Deposit"
  puts "4) Withdraw"
  puts "5) Add another account"
  puts "6) Search for account by name"
  puts "7) Print bank report to file"
  puts "8) List all accounts"
  puts "0) Exit"
  choice = prompt("Choose an option: ")

  begin
    case choice
    when "1", "5"
      name = prompt("Account holder name: ")
      pin  = prompt("Set a 4-digit PIN: ")
      start_bal = prompt("Starting balance (default 0): ")
      start_bal = start_bal.empty? ? 0.0 : Float(start_bal)
      bank.add_account(name, pin, start_bal)

    when "2"
      name = prompt("Account holder name: ")
      acct = bank.find_account(name)
      if acct
        pin = prompt("Enter PIN: ")
        acct.authenticate?(pin) ? acct.display_balance : (puts "Access denied. Incorrect PIN.")
      else
        puts "Account not found."
      end

    when "3"
      name = prompt("Account holder name: ")
      acct = bank.find_account(name)
      if acct
        pin = prompt("Enter PIN: ")
        if acct.authenticate?(pin)
          amount = prompt_amount("Deposit")
          acct.deposit(amount)
        else
          puts "Access denied. Incorrect PIN."
        end
      else
        puts "Account not found."
      end

    when "4"
      name = prompt("Account holder name: ")
      acct = bank.find_account(name)
      if acct
        pin = prompt("Enter PIN: ")
        if acct.authenticate?(pin)
          amount = prompt_amount("Withdrawal")
          acct.withdraw(amount)
        else
          puts "Access denied. Incorrect PIN."
        end
      else
        puts "Account not found."
      end

    when "6"
      name = prompt("Search name: ")
      acct = bank.find_account(name)
      acct ? puts("Found: #{acct.name} — Balance $#{'%.2f' % acct.balance}") : puts("No account for '#{name}'.")

    when "7"
      bank.print_report!

    when "8"
      accts = bank.list_accounts
      if accts.empty?
        puts "No accounts yet."
      else
        accts.each { |a| puts "#{a.name} — $#{'%.2f' % a.balance}" }
      end

    when "0"
      puts "Goodbye!"
      break

    else
      puts "Invalid option."
    end
  rescue => e
    puts "Error: #{e.message}"
  end
end
