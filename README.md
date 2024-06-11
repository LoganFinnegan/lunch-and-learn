ic: 
Lunch and Learn - Places

    Create a branch off of your Lunch and Learn project as directed by your instructors (eg, "final" or "retake")
    As you work, you should commit to this branch every 15 minutes.
    DO NOT push your code to your GitHub repo until the end of the 3 hour assessment, unless otherwise directed by instructors
    Complete the user story below. You should:

    TDD all of your work
    Prioritize getting your code functional before attempting any refactors
    Write/refactor your code to achieve good code quality

Assignment

You will be using the "Geoapify API" to search for a country's tourist sites. Presume that your user will give a valid country (you can handle edge cases later).

Your endpoint should follow this format:

GET /api/v1/tourist_sites?country=France

Please do not deviate from the names of the endpoint or query parameters. Be sure it is called "tourist_sites" and "country", respectively. Your API will return:

    A collection of 10 tourist sites near the country's latitude and longitude.
        First, use the "Forward Geocoding" endpoint to find a lat-lon for a given country).
        Then use the lat/lon returned from the Forward Geocoding endpoint to search the "Places" endpoint for results in the "tourism" category.
    Each tourist_site should list its:
        name
        formatted address
        place_id (from the Geoapify API Place endpoint)

Your response should be in the format below:

{
    "data": [
        {
            "id": null,
            "type": "tourist_site",
            "attributes": {
                "name": "Tour de l'horloge",
                "address": "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
                "place_id": "51d28..."
            }
        },
        {
            "id": null,
            "type": "tourist_site",
            "attributes": {
                "name": "Le Château",
                "address": "Le Château, D 18, 23150 Ahun, France",
                "place_id": "51934..."
            }
        },
        {
            "id": null,
            "type": "tourist_site",
            "attributes": {
                "name": "Le Chapître",
                "address": "Le Chapître, Rue du Chapitre, 23200 Aubusson, France",
                "place_id": "517182..."
            }
        },
        ...,
        ...,
    ]
}