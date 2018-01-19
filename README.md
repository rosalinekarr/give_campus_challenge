# Notes

I probably wasted too much time setting up the donation model and implementing
matching maximums incorrect when I misunderstood the problem. If I had more
time, I would have made the following changes:

- Better testing on the `Match` model and `DonationsController`
- I would have added a `total_donated` column to the `matches` table for more
  efficient tracking on which matches should be fetched in the controller.
- I would have cleaned up the front end much more
