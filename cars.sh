#! /bin/bash
# cars.sh
# Author: Jude Barry

INVENTORY_FILE="my_old_cars"

if [ ! -f "$INVENTORY_FILE" ]; then
    touch "$INVENTORY_FILE"
fi

while true; do
    echo
    echo "Old Cars Inventory Menu"
    echo "-----------------------"
    echo "1) Add a car"
    echo "2) List cars (sorted by year)"
    echo "3) Quit"
    printf "Enter choice (1, 2, or 3): "
    read -r CHOICE

    case "$CHOICE" in
        1)
            printf "Year: "
            read -r YEAR
            printf "Make: "
            read -r MAKE
            printf "Model: "
            read -r MODEL

            YEAR="$(echo "$YEAR" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
            MAKE="$(echo "$MAKE" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
            MODEL="$(echo "$MODEL" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

            if ! [[ "$YEAR" =~ ^[0-9]{3,4}$ ]]; then
                echo "Invalid year. Please enter a 3- or 4-digit year (e.g. 1977)."
            else
                printf '%s:%s:%s\n' "$YEAR" "$MAKE" "$MODEL" >> "$INVENTORY_FILE"
                echo "Car added: $YEAR:$MAKE:$MODEL"
            fi
            ;;
        2)
            if [ ! -s "$INVENTORY_FILE" ]; then
                echo "Inventory is empty."
            else
                echo
                echo "Inventory (sorted by year):"
                sort -t: -k1,1n "$INVENTORY_FILE"
            fi
            ;;
        3)
            echo "Goodbye"
            break
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done

