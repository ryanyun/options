@contract ||= contract

json.id @contract.id
json.buyer_id @contract.buyer_id
json.seller_id @contract.seller_id
json.address @contract.address
json.amount @contract.amount
json.price @contract.price
json.start_time @contract.start_time
json.end_time @contract.end_time
json.status @contract.status
json.buyer_confirmed? @contract.buyer_confirmed?
json.seller_confirmed? @contract.seller_confirmed?
json.created_at @contract.created_at
json.updated_at @contract.updated_at
