# Define the list of participants
$participants = @("Kateryna", "Alex", "Sammy", "Vincent")

# Shuffle the participants to randomize the order
$shuffledParticipants = $participants | Get-Random -Count $participants.Count

# Define the list of gifts
$gifts = @("Book", "Chocolate", "Candle", "Socks")
$numbers = @("1", "2", "3", "4")

# Shuffle the numbers to randomize their order
$shuffledNumbers = $numbers | Get-Random -Count $numbers.Count

# Initialize an empty hashtable to store the number-gift assignments
$numberAssignments = @{}

# Allow each participant to pick a number
foreach ($participant in $shuffledParticipants) {
    Write-Host "$participant, it's your turn to pick a number."
    
    # Display available numbers
    Write-Host "Available numbers: $($shuffledNumbers -join ', ')"
    
    # Prompt for number selection
    $selectedNumber = Read-Host "Choose a number"
    
    if ($shuffledNumbers -contains $selectedNumber) {
        # Assign the selected number to the participant
        $numberAssignments[$participant] = $selectedNumber
        $shuffledNumbers = $shuffledNumbers | Where-Object {$_ -ne $selectedNumber}
    }
    else {
        Write-Host "Invalid selection. Please choose a valid number."
    }
}

# Display the gift assignments instead of numbers
Write-Host ""
Write-Host "Gift Assignments:"
$numberAssignments.GetEnumerator() | ForEach-Object {
    $participant = $_.Key
    $number = $_.Value
    $gift = $gifts[$number - 1]  # Adjust the index since arrays are 0-based
    Write-Host "$participant is assigned the gift: $gift"
}
