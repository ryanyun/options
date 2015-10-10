chris = User.create(first_name: 'Chris',
                    last_name: 'Jeon',
                    email: 'chris0374@gmail.com',
                    password: 'password',
                    password_confirmation: 'password',
                    uid: SecureRandom.uuid)

ryan = User.create(first_name: 'Ryan',
                   last_name: 'Yun',
                   email: 'ryan@gmail.com',
                   password: 'password',
                   password_confirmation: 'password',
                   uid: SecureRandom.uuid)

contract = Contract.create(seller_id: ryan.id,
                           amount: 11.11,
                           price: 12.12,
                           start_time: DateTime.now,
                           end_time: 1.day.from_now)

bid = Bid.create(contract_id: contract.id,
                 bidder_id: chris.id)
