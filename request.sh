#! /bin/bash
echo 'Local Node Express'

average_time=0

for i in {1..20}
do
    instance_time=`curl http://localhost:3000 -s -o /dev/null -w "%{time_starttransfer}\n" -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmb28iOiJiYXIiLCJpYXQiOjE2MDY1MDY1MjV9.47xQyUxCsl5NTvflu1J6-cjIoTtwacLbsLLLjR9L460"`
    echo $instance_time
    average_time=`echo "scale=5; ${average_time} + ${instance_time}" | bc`
    echo $average_time
done

echo "Average time is: "
echo "scale=5; ${average_time} / 20" | bc
