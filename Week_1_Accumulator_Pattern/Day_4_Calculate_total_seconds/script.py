def calculate_total_seconds(minutes):
    """
    - Calculate Total Seconds From List of Minutes
    Step 1: Start with total = 0
    Step 2: Get minute and convert to seconds
    Step 3: Add the seconds of the first conversion to the total
    Step 4: Repeat step 2 and 3 for subsequent minutes
    Step 5: Return total in seconds
    """
    if not minutes:
        return "You have no minutes to your workout"
    total = 0
    for minute in minutes:
        seconds = 60 * minute
        total  = total + seconds
    return total

minutes = [2, 5, 10]

if __name__ == "__main__":
    print(calculate_total_seconds(minutes))
