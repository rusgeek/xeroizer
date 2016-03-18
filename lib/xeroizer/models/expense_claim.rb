module Xeroizer
  module Record
    
    class ExpenseClaimModel < BaseModel
        
      set_permissions :read, :write, :update

      public      

    end
    
    class ExpenseClaim < Base
      
      CLAIM_STATUS = {
        'AUTHORISED' =>       'An expense claim has been authorised for payment',
        'SUBMITTED' =>        'An expense claim has been submitted for approval (default)',
        'PAID' =>             'An expense claim has been paid'
      } unless defined?(CLAIM_STATUS)
      CLAIM_STATUSES = CLAIM_STATUS.keys.sort
      
      set_primary_key :expense_claim_id
      set_possible_primary_keys :expense_claim_id #, :receipt_number
      list_contains_summary_only false
      
      guid          :expense_claim_id
      string        :status
      datetime_utc  :updated_date_utc, :api_name => 'UpdatedDateUTC'
      decimal       :total, :calculated => false
      decimal       :amount_due, :calculated => false
      decimal       :amount_paid, :calculated => false
#      date          :payment_due_date
#      date          :reporting_date
      
      has_many      :receipts
      
#      validates_inclusion_of :status, :in => RECEIPT_STATUSES, :allow_blanks => true
      validates_associated :receipts
      
      public

    end
    
  end
end
