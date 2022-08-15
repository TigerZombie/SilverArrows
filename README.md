# SilverArrows
CwC Challenge Car Listing App


Here are my initial thoughts:

I will list cars, of course, and I decided to list the modern silver arrow cars from the AMG Petronas Formula One Team (2010 - today). That’ll be 11 cars, with a distinct start (2010, when Mercedes re-joined the Formula 1 with its own team) and end, so the content is coherent and provides enough room for filtering.
The car pictures will be image assets. The data for each car will be stored in a single JSON file. This will be an offline app, thus, no downloadable content and no network requests.
Code will be shared via github.
I will try to prototype the app in Figma. Colors will be mainly silver, black, turquoise (team colors). Maybe I will add a dark mode, let’s see.
Let’s recap the requirements (slightly modified to fit my app) and stages:

Stage Gold:

All data will be retrieved from a JSON file.
List of the cars; the cars will be presented in their own card.
Each card will contain the car picture, car name, and F1 year.

Stage Platinum:

Cards can be expanded by tapping them. Only one card can be expanded; the remaining will be collapsed automatically.
By default, the first card is expanded when opening the app
Expanded details will include (but is not limited to) the drivers in that season, and some statistics, such as: Overall championship points, overall podiums, if a world championship was won by a driver and/or team (so the amount of content will vary and the cards will be expanded accordingly)

Stage Diamond:

Implementing the filter section
Two filters. One for team championship won/not won, and maybe one for overall points? Thinking of a slider from min to max points and this data is retrieved from the JSON file (so not hard coded, as in a real life app this data could change every year or if the app would also include other teams, then the min/max points per season would be different for each team)
