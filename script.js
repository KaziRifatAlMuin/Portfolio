function submitForm() {
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const message = document.getElementById('message').value;

    console.log("Name:", name, "Email:", email, "Message:", message); // Debugging

    if (name && email && message) {
        alert("Message sent successfully!");
        document.getElementById('contact-form').reset(); // Reset form fields
        return true; // Allow form submission
    } else {
        alert("Please fill out all fields.");
        return false; // Prevent form submission
    }
}
