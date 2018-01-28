def pet_shop_name(name)

  return @pet_shop[:name]

end

def total_cash(shop)

  return @pet_shop[:admin][:total_cash]

end

def add_or_remove_cash(shop, amount)

  @pet_shop[:admin][:total_cash] += amount

end

def pets_sold(shop)

  return @pet_shop[:admin][:pets_sold]

end

def increase_pets_sold(shop, sold)

  @pet_shop[:admin][:pets_sold] += sold

end

def stock_count(shop)

  return @pet_shop[:pets].length

end

def pets_by_breed(shop, pet_breed)

  same_breed = []
  for pet in shop[:pets]
    if pet_breed == pet[:breed]
      same_breed.push(pet)
    end
  end

  return same_breed

end

def find_pet_by_name(shop, pet_to_find)
  for pet in shop[:pets]
    count = 0
    while count < shop[:pets].length
      if pet_to_find == pet[:name]
        return pet
      else
      count += 1
      end
    end
  end
  return nil

end

def remove_pet_by_name(shop, pet_to_remove)

  pet = find_pet_by_name(shop, pet_to_remove)
  shop[:pets].delete(pet)

end

def add_pet_to_stock(shop, pet_to_add)
  shop[:pets].push(pet_to_add)

end

def customer_pet_count(customer)

  # for customer in @customers
  #
  #   if customer == customer_to_count
  #     return customer[:pets].length
  #   end
  #
  # end

  return customer[:pets].length

end

def add_pet_to_customer(customer, pet_to_add)

  customer[:pets].push(pet_to_add)

end

def customer_can_afford_pet(customer, pet)

  if customer[:cash] >= pet[:price]
    return true
  else
    return false
  end

end

def sell_pet_to_customer(shop, pet, customer)

  # to_sell = find_pet_by_name(shop, pet)
  if pet != nil && customer_can_afford_pet(customer, pet) == true

      add_pet_to_customer(customer, pet)
      increase_pets_sold(shop, 1)
      add_or_remove_cash(shop, pet[:price])

  end

end
