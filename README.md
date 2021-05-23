# eurovision-2021-dataset
Dataset of the points awarded by national jury and public for the 2021 Eurovision song contest final (in long format). Note, rows where `performing_country == voting_country` are included, but in the contest a country can't award points to itself.



## eurovision_2021_scores.csv

**performing_country:** Which of the 26 countries performed at the final on 22nd May 2021.

**voting_type:** Column to indicate the type of voting for the `points_awarded`, can be either `'jury'` or `'public'`

**voting_country:** Which of the 43 countries awarded points to the `performing_country` on the final on 22nd May 2021.

**points_awarded:** The number of points awared from the `voting_country` to the `performing_country`
