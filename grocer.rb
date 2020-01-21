def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  c = 0
  itm = ""
  while c < collection.length do
    if collection[c][:item] == name
      item = collection[c]
    end
    c += 1
  end
  item
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
    cnt = 0
    c_cart = []
    ## creats an array of the items in the cart
    while cnt < cart.length do
      cart[cnt].store(:count, 0)
      c_cart << cart[cnt][:item]
      cnt += 1
    end
    cart.inspect
    #makes the array ahve only 1 name per item
    c_cart = c_cart.uniq
    ## take the array of items and cycles through it
    c = 0
    while c < c_cart.length do
      ## takes the cart and cycles through it
      d = 0
      while d < cart.length do
        ## test if c_cart = same thing as current cart item
        if c_cart[c] == cart[d][:item]
          cart[d][:count] += 1
          if cart[d][:count] > 1
            cart.delete_at(d)
          end
        end
        d += 1
      end
      c += 1
    end
    cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  c = 0
  ## looking at the coupons one by one
  while c < coupons.length do
    d = 0
    discount_price = 0
    discount_price = coupons[c][:cost]/coupons[c][:num]
    discount_price
    ## looking at the items in the cart one by one
    while d < cart.length do
      ## if item and count for discount match then change cart item to 'item w/coupons'
      items_in_cart = cart.length
      items_in_cart
      if coupons[c][:item] == cart[d][:item] and coupons[c][:num] == cart[d][:count]
        cart[d][:count] = cart[d][:count] - coupons[c][:num]
        cart[items_in_cart] = Hash[:item => "#{cart[d][:item]} W/COUPON", :price => discount_price, :clearance => cart[d][:clearance], :count => coupons[c][:num]]
      end
      pp cart.length
      d += 1
    end
    c += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  c = 0
  while c < cart.length do
    if cart[c][:clearance] == true
      cart[c][:price] = cart[c][:price] - (cart[c][:price] * 0.2 )
      cart[c][:price]
    end
    c += 1
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  consolidate_cart(cart)
  apply_coupons(cart, coupons)
  apply_clearance(cart)
  pp cart 
  c = 0
  tot = 0 
  while c < cart.length do
    tot += cart[c][:price]
    c += 1 
  end 
  if tot > 100.00 
    tot = tot - (tot * 0.1)
  end 
  tot 
end
