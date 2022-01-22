# Generate Passwords in Julia
@time begin
using ProgressBars
using Random

# WARNING: Do not use this code to generate actual passwords!
function generate_passwords()
    println("How many passwords do you want to generate?")
    num_passwords = parse(Int64, Base.prompt(" "))
    password_length = parse(Int64, Base.prompt("How long should each password be?"))

    # Create an empty vector / array
    password_holder = []

    # Generate a progress bar to show how close we are to being done
    for i in ProgressBar(1:num_passwords)
        # Add the new password into the password holder
        push!(password_holder, randstring(password_length))
        sleep(1) # Manually slowdown the generation of passwords to see the ProgressBar
    end

    # Only show the passwords if there are less than 100
    if length(password_holder) <= 100
        # Loop through each password one by one
        for password in password_holder
            print("\n", password)
        end
    end
end

generate_passwords()
end
