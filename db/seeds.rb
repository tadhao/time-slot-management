date = DateTime.now + 1
start_time = DateTime.parse(date.strftime('%Y-%m-%dT01:00:00%z'))
end_time = DateTime.parse(date.strftime('%Y-%m-%dT02:00:00%z'))
Slot.create([{ start_time: start_time, end_time: end_time, total_capacity: 6 }])
