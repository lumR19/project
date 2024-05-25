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
