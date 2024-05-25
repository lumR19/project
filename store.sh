<<<<<<< HEAD
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

=======
echo " hi "
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

echo "___________"
echo "Note : the wrapping price is = 25 SAR no matter how much flowers you chosed."
# Function to display flower options
display_flower_options() {
    echo "___________"
    echo "Available flower types:"
    for flower in "${!flower_prices[@]}"; do
        echo "$flower (${flower_prices[$flower]} SAR)"
    done
    echo "___________"
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
>>>>>>> e385a902b805058c28dfebb19a6baa3e7811f754
