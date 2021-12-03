import spotipy
from spotipy.oauth2 import SpotifyOAuth

scope = 'user-top-read'
sp = spotipy.Spotify(auth_manager=SpotifyOAuth(scope=scope))

ranges = ['short_term', 'medium_term', 'long_term']

for tracks in ranges:
    print("range:", tracks)
    results = sp.current_user_top_tracks(time_range=tracks, limit=10)
    for x, item in enumerate(results['items']):
        print(x, item['name'], '//', item['artists'][0]['name'])
    print()
