import matplotlib.pyplot as plt
import pandas as pd

# Initialize the lists for X and Y
data = pd.read_csv('D:\eu_Events_Systems.csv')

df = pd.DataFrame(data)

X = list(df.iloc[:, 0])
Y = list(df.iloc[:, 1])

# Plot the data using bar() method
plt.bar(X, Y, color='g')
plt.title("Sum of event price by event perks",fontweight='bold')
plt.xlabel("Event perks",fontweight='bold')
plt.ylabel("Events price",fontweight='bold')

# Show the plot
plt.show()


# get input data
df1 = pd.read_csv('D:\ser.csv')

ax = df1.plot(x='twitter_handle', y=['follower_count', 'following_count'])
ax.set_ylabel("Count",fontweight='bold')
plt.show()