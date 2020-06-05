import random
TOTAL_LENGTH = 2000*40
STOPS = 50

# Generates a bunch of fake distance values for april fools
# "Sliding Method"
even = TOTAL_LENGTH // STOPS

cuts = list(range(0, TOTAL_LENGTH, even))

for i in range(len(cuts)):
    delta = random.randint(-even//2, even//2)
    cuts[i] += delta

lengths = []
for i in range(1, len(cuts)):
    lengths.append(cuts[i]-cuts[i-1])
lengths.append(TOTAL_LENGTH - sum(lengths))

print(lengths)
print(len(lengths), max(lengths), min(lengths), sum(lengths)//len(lengths))
print(sum(lengths))

# "Scrambled Fib Method"
# # First n terms of fibonacci
# def fib(n):
#     fibs = [1, 1]
#     for _ in range(n-2):
#         fibs.append(fibs[-1]+fibs[-2])
#     return fibs


# print(fib(50))

# "Just pick random numbers and adjust until it works Method"
# MIN = 300
# MAX = 1000
# lengths = []
# mean = (MIN+MAX)//2
# sd = (MIN+MAX)//6
# for i in range(STOPS):
#     lengths.append(int(random.gauss(1000, 300)))
# diff = TOTAL_LENGTH - sum(lengths)
# print(lengths)
# print(diff)
