road('Makkah', 'Madinah').
road('Madinah', 'Makkah').
road('Madinah', 'Taif').
road('Madinah', 'Tabuk').
road('Tabuk', 'Taif').
road('Makkah', 'Riyadh').
road('Taif', 'Dammam').
road('Dammam', 'Riyadh').
road('Riyadh', 'Dammam').
road('Dammam', 'Al-Qatif').
road('Al-Qatif', 'Dammam').
road('Al-Qatif', 'Madinah').

travel(Start, Destination, Path) :-
    travel_path(Start, Destination, [Start], ReversePath),
    reverse(ReversePath, Path).

travel_path(Destination, Destination, Visited, Visited).

travel_path(Current, Destination, Visited, Path) :-
    road(Current, Next),
    \+ member(Next, Visited),
    travel_path(Next, Destination, [Next|Visited], Path).
