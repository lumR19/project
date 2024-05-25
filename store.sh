
# Welcome message
echo "Welcome to our Flower Bouquet Creator!"

# Get user information
echo "Please enter your name:"
read name

while true; do
    read -p "Please enter your phone number (10 digits): " phone_number

    # Check if the phone number is 10 digits
    if [ "${#phone_number}" -eq 10 ]; then
        echo "Phone number saved."
        break
    else
        echo "Invalid phone number. Please enter a 10-digit number."
        continue
    fi
done


# Generate order number
order_number=$RANDOM

# Location options
location_selected=false
while [ "$location_selected" = false ]; do
    echo "Please select your location:"
    echo "1. Makkah"
    echo "2. Jeddah"
    echo "3. Taif"
    read location_choice

    case $location_choice in
        1)
            location="Makkah"
            location_selected=true
            ;;
        2)
            location="Jeddah"
            location_selected=true
            ;;
        3)
            location="Taif"
            location_selected=true
            ;;
        *)
            echo "Invalid location choice. Please try again."
            ;;
    esac
done

# Flower options
declare -A flower_prices=(
    [Rose]=37.5
    [Lily]=45
    [Tulip]=30
    [Sunflower]=56.25
    [Orchid]=75
    [Carnation]=22.5
    [Daisy]=26.25
    [Peony]=67.5
    [Chrysanthemum]=52.5
    [Iris]=41.25
)

echo "_____________________________"
echo "Note : the wrapping price is = 25 SAR no matter how much flowers you chosed."
# Function to display flower options
display_flower_options() {
    echo "_____________________________"
    echo "Available flower types:"
    for flower in "${!flower_prices[@]}"; do
        echo "$flower (${flower_prices[$flower]} SAR)"
    done
    echo "_____________________________"
}



# Main script
flower_types=()
flower_quantities=()
while true; do
    display_flower_options
    # Get flower selection
    while true; do
        echo "Please select the flower type ,please enter the name exactly as written (including capital and small letters):"
        read flower_type
        if [[ -n ${flower_prices[$flower_type]} ]]; then
            flower_types+=("$flower_type")
            echo "How many of $flower_type would you like?"
            read flower_quantity
            flower_quantities+=("$flower_quantity")
            break
        else
            echo "Invalid flower type. Please select from the list."
        fi
    done
    # Ask if more flowers are needed
    echo "Do you want to order more flowers in the same bouquet? (yes/no)"
    read more_flowers
    if [[ $more_flowers == "no" ]]; then
        break
    fi
done


# Function to calculate total price without wrapping
calculate_total_price() {
    local total=0
    for i in "${!flower_types[@]}"; do
        price_per_unit=${flower_prices[${flower_types[$i]}]}
        quantity="${flower_quantities[$i]}"
        total=$(echo "scale=2; $total + $price_per_unit * $quantity" | bc)
    done
    echo "$total"
}

# Calculate total price
total_price=$(calculate_total_price)
echo "Total price for the selected flowers: $total_price SAR"

# Wrapping options
echo "Please select the wrapping color:"
read wrap_color
echo "Please select the ribbon color:"
read ribbon_color

# Ask for delivery or pickup
while true; do
    read -p "Do you want delivery or pickup? (1 for delivery, 2 for pickup): " delivery_or_pickup_choice
    if [ "$delivery_or_pickup_choice" = "1" ]; then
        delivery_or_pickup="delivery"
        while true; do
        read -p "Enter the desired delivery date (YYYY/MM/DD): " delivery_date
        if [[ "$delivery_date" =~ ^[0-9]{4}/[0-9]{2}/[0-9]{2}$ ]]; then
            break
        else
            echo "Invalid date format."
        fi
    done
        break
        
    elif [ "$delivery_or_pickup_choice" = "2" ]; then
        delivery_or_pickup="pickup"
        while true; do
        read -p "Enter the desired pickup date (YYYY/MM/DD): " pickup_date
        if [[ "$pickup_date" =~ ^[0-9]{4}/[0-9]{2}/[0-9]{2}$ ]]; then
            break
        else
            echo "Invalid date format."
        fi
    done
        break
    else
        echo "Invalid choice. Please try again."
    fi
done
while true; do
    read -p "Total amount of $total_price SAR ,Do you want to continue the paying? (y/n): " pay_choice
    if [ "$pay_choice" = "y" ]; then
        while true; do
      read -p "Please select a payment method (1 for card, 2 for cash on delivery/pickup, or 3 for PayPal): " payment_method

      if [ "$payment_method" = "2" ]; then
         echo "Please pay with cash on delivery/pickup and use the folowing order Number [$order_number] to pickup your bouquet."
        
        break
    elif [ "$payment_method" = "1" ]; then
        read -p "Enter the card holder name: " card_holder_name
        read -p "Enter the card number: " card_number

        # Check if the card number is 16 digits
        if [ "${#card_number}" -eq 16 ]; then
          
while true; do
    # Prompt for card expiration date
    read -p "Enter card expiration date (MM/YY): " exp_date

    # Validate card expiration date format
    if [[ "$exp_date" =~ ^[0-9]{2}/[0-9]{2}$ ]]; then
        # Extract month and year from expiration date
        exp_month=${exp_date:0:2}
        exp_year=${exp_date:3:2}

        # Check if expiration date is in the future
        current_year=$(($(date +%y)))
        if [[ "$exp_year" -gt "$current_year" || ("$exp_year" -eq "$current_year" && "$exp_month" -gt $(date +%-m)) ]]; then
            echo "Valid expiration date."
            break
        else
            echo "Card expired. Please enter a valid expiration date."
            continue
        fi
    else
        echo "Invalid expiration date format. Please try again."
        continue
    fi
done
            
           while true; do
    # Prompt the user to enter the CVV
    read -p "Enter the card CVV: " cvv

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
echo "_____________________________________"
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
