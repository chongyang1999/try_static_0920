export async function fetchMessage() {
    try {
        const response = await fetch('http://localhost:7071/api/HttpTrigger1?name=YourName');
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Fetch error:', error);
        throw error;
    }
}