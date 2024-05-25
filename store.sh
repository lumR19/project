echo " hi "
# Check if the CVV is a 3-digit number
    if [[ ${#cvv} -eq 3 && $cvv =~ ^[0-9]+$ ]]; then
        echo "Valid CVV: $cvv"
        break
    else
        echo "Invalid CVV. Please enter a 3-digit number."
        continue
    fi
done

            echo "Payment successful!"
            break
           
            read -p "Do you want to save this card on our website? (y/n) " save_card
            if [ "$save_card" = "y" ]; then
                echo "Card information saved."
            else
                echo "Card information not saved."
            fi
            break
        else
            echo "Invalid card number. Please try again."
            continue
        fi
    elif [ "$payment_method" = "3" ]; then
        echo "Redirecting to PayPal..."
        echo "Payment successful!"
       break
    else
        echo "Invalid payment method. Please try again."
    fi
done
       
        break
    elif [ "$pay_choice" = "n" ]; then
        echo "Order cancelled."
        break
    else
        echo "Invalid choice. Please try again."
    fi
done

# Function to calculate total price with wrapping
calculate_total_price1() {
    local flower_total=0
    for i in "${!flower_types[@]}"; do
        price_per_unit=${flower_prices[${flower_types[$i]}]}
        quantity="${flower_quantities[$i]}"
        flower_total=$(echo "scale=2; $flower_total + $price_per_unit * $quantity" | bc)
    done
    
    local wrapping_price=25
    local final_price=$(echo "scale=2; $flower_total + $wrapping_price" | bc)
    echo "$final_price"
}

# Display order summary
echo "_"
echo "Order Summary:"
echo "Order Number: $order_number"
echo "Name: $name"
echo "Phone: $phone_number"
echo "Location: $location"
echo "Delivery/Pickup: $delivery_or_pickup"
if [ "$delivery_or_pickup" = "delivery" ]; then
    echo "Delivery Date: $delivery_date"
else
    echo "Pickup Date: $pickup_date"
fi

for ((i=0; i<${#flower_types[@]}; i++)); do
    echo "Flower: ${flower_quantities[$i]} x ${flower_types[$i]} (${flower_prices[${flower_types[$i]}]} SAR each)"
done
echo "Wrapping: $wrap_color with $ribbon_color ribbon (25 SAR)"

# Function to calculate total price with wrapping
calculate_total_price1() {
    local flower_total=0
    for i in "${!flower_types[@]}"; do
        price_per_unit=${flower_prices[${flower_types[$i]}]}
        quantity="${flower_quantities[$i]}"
        flower_total=$(echo "scale=2; $flower_total + $price_per_unit * $quantity" | bc)
    done
    
    local wrapping_price=25
    local final_price=$(echo "scale=2; $flower_total + $wrapping_price" | bc)
    echo "$final_price"
}
# Calculate total price
final_price=$(calculate_total_price1)
echo "Total Price: $final_price SAR"
# Check if delivery was chosen
if [ "$delivery_or_pickup_choice" = "1" ]; then
    # Display success message if payment was successful
    if [ "$payment_method" = "1" ] || [ "$payment_method" = "3" ]; then
        echo "Thank you, the delivery representative will contact you to deliver it to your door."
    else
        echo "Your order will be ready for pickup on $pickup_date."
    fi
else
    echo "Your order will be ready for pickup on $pickup_date."
fi
# Check if the CVV is a 3-digit number
    if [[ ${#cvv} -eq 3 && $cvv =~ ^[0-9]+$ ]]; then
        echo "Valid CVV: $cvv"
        break
    else
        echo "Invalid CVV. Please enter a 3-digit number."
        continue
    fi
done

            echo "Payment successful!"
            break
           
            read -p "Do you want to save this card on our website? (y/n) " save_card
            if [ "$save_card" = "y" ]; then
                echo "Card information saved."
            else
                echo "Card information not saved."
            fi
            break
        else
            echo "Invalid card number. Please try again."
            continue
        fi
    elif [ "$payment_method" = "3" ]; then
        echo "Redirecting to PayPal..."
        echo "Payment successful!"
       break
    else
        echo "Invalid payment method. Please try again."
    fi
done
       
        break
    elif [ "$pay_choice" = "n" ]; then
        echo "Order cancelled."
        break
    else
        echo "Invalid choice. Please try again."
    fi
done

# Function to calculate total price with wrapping
calculate_total_price1() {
    local flower_total=0
    for i in "${!flower_types[@]}"; do
        price_per_unit=${flower_prices[${flower_types[$i]}]}
        quantity="${flower_quantities[$i]}"
        flower_total=$(echo "scale=2; $flower_total + $price_per_unit * $quantity" | bc)
    done
    
    local wrapping_price=25
    local final_price=$(echo "scale=2; $flower_total + $wrapping_price" | bc)
    echo "$final_price"
}

# Display order summary
echo "_"
echo "Order Summary:"
echo "Order Number: $order_number"
echo "Name: $name"
echo "Phone: $phone_number"
echo "Location: $location"
echo "Delivery/Pickup: $delivery_or_pickup"
if [ "$delivery_or_pickup" = "delivery" ]; then
    echo "Delivery Date: $delivery_date"
else
    echo "Pickup Date: $pickup_date"
fi

for ((i=0; i<${#flower_types[@]}; i++)); do
    echo "Flower: ${flower_quantities[$i]} x ${flower_types[$i]} (${flower_prices[${flower_types[$i]}]} SAR each)"
done
echo "Wrapping: $wrap_color with $ribbon_color ribbon (25 SAR)"

# Function to calculate total price with wrapping
calculate_total_price1() {
    local flower_total=0
    for i in "${!flower_types[@]}"; do
        price_per_unit=${flower_prices[${flower_types[$i]}]}
        quantity="${flower_quantities[$i]}"
        flower_total=$(echo "scale=2; $flower_total + $price_per_unit * $quantity" | bc)
    done
    
    local wrapping_price=25
    local final_price=$(echo "scale=2; $flower_total + $wrapping_price" | bc)
    echo "$final_price"
}
# Calculate total price
final_price=$(calculate_total_price1)
echo "Total Price: $final_price SAR"
# Check if delivery was chosen
if [ "$delivery_or_pickup_choice" = "1" ]; then
    # Display success message if payment was successful
    if [ "$payment_method" = "1" ] || [ "$payment_method" = "3" ]; then
        echo "Thank you, the delivery representative will contact you to deliver it to your door."
    else
        echo "Your order will be ready for pickup on $pickup_date."
    fi
else
    echo "Your order will be ready for pickup on $pickup_date."
fi
