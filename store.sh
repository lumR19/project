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

