## Hypofriend gem

### Install

`gem install hypofriend`

### Examples

```ruby
require 'hypofriend'

client = Hypofriend.new
offers = client.new_offer(loan_amount: 150000, property_value: 300000, repayment: 2.0, years_fixed: 20)
#=> [#<Hypofriend::Offer:0x00007fd5bb12c8c8 @institution_name="ING_DIBA", @borrowing_rate=1.22>]
offers.first.institution_name
#=> "ING_DIBA"
offers.first.borrowing_rate
#=> 1.22
```
