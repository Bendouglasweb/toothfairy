for i in {1..50};
do
sleep 0.35
curl http://45.55.58.84:4000/new/AA/Upper_$[RANDOM % 1000000]/Lower_$[RANDOM % 1000000]/Posterior_$[RANDOM % 1000000]
done
