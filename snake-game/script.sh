clear
for i in {1..10}; do
    for j in {1..10}; do
        if [[ $i -eq 1 || $i -eq 10 || $j -eq 1 || $j -eq 10 ]]; then
            echo -n "#"
        else
            echo -n " "
        fi
    done
    echo
done

stty -echo -icanon time 0 min 0

while true; do
    read -n 1 input
    case "$input" in
        w) direction="UP" ;;
        s) direction="DOWN" ;;
        a) direction="LEFT" ;;
        d) direction="RIGHT" ;;
    esac
done

snake=("3 5" "3 6" "3 7")  # List of x,y positions

new_head="$((x+dx)) $((y+dy))"
snake=("$new_head" "${snake[@]:0:${#snake[@]}-1}")


if [[ " ${snake[@]} " =~ " $new_head " ]]; then
    echo "Game Over!"
    exit 0
fi


if [[ $x -le 1 || $x -ge 10 || $y -le 1 || $y -ge 10 ]]; then
    echo "Crashed into the wall!"
    exit 0
fi


food_x=$(( RANDOM % 8 + 2 ))
food_y=$(( RANDOM % 8 + 2 ))

if [[ "$new_head" == "$food_x $food_y" ]]; then
    snake+=("$new_head")  # Grow the snake
    food_x=$(( RANDOM % 8 + 2 ))
    food_y=$(( RANDOM % 8 + 2 ))
fi

