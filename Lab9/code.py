import re
import string
import pandas as pd 

def parsingTable(getFollowSet, rules):
	
	print "\nParsing Table\n"

	table = {}
	for key in rules:
		for value in rules[key]:
			if value!='@':
				for element in getFirstSet(value, rules):
					table[key, element] = value
			else:
				for element in getFollowSet[key]:
					table[key, element] = value

	new_table = {}
	for pair in table:
		new_table[pair[1]] = {}

	for pair in table:
		new_table[pair[1]][pair[0]] = table[pair]

	print pd.DataFrame(new_table).fillna('-')
	print "\n"
	return table

def getFollowSet(s, rules, ans):
	if len(s)!=1 :
		return {}

	for key in rules:
		for value in rules[key]:
			f = value.find(s)
			if f!=-1:
				if f==(len(value)-1):
					if key!=s:
						if key in ans:
							temp = ans[key]
						else:
							ans = getFollowSet(key, rules, ans)
							temp = ans[key]
						ans[s] = ans[s].union(temp)
				else:
					first_of_next = getFirstSet(value[f+1:], rules)
					if '@' in first_of_next:
						if key!=s:
							if key in ans:
								temp = ans[key]
							else:
								ans = getFollowSet(key, rules, ans)
								temp = ans[key]
							ans[s] = ans[s].union(temp)
							ans[s] = ans[s].union(first_of_next) - {'@'}
					else:
						ans[s] = ans[s].union(first_of_next)
	return ans

def getFirstSet(s, rules):
	c = s[0]
	ans = set()
	if c.isupper():
		for st in rules[c]:
			if st == '@' :				
				if len(s)!=1 :
					ans = ans.union( getFirstSet(s[1:], rules) )
				else :
					ans = ans.union('@')
			else :	
				f = getFirstSet(st, rules)
				ans = ans.union(x for x in f)
	else:
		ans = ans.union(c)
	return ans

if __name__=="__main__":
	rules=dict()
	grammar = open("grammar1.txt", "r")
	first_dict = dict()
	follow_dict = dict()
	flag = 1
	start = ""
	
	print 'Grammar:\n'
	for line in grammar:
		print "\t"+line
		l = re.split("( |->|\n|\||)*", line)
		lhs = l[0]
		rhs = set(l[1:-1])-{''}
		if flag :
			flag = 0
			start = lhs
		rules[lhs] = rhs
	
	print '\nFirst Set:\n'
	for lhs in rules:
		first_dict[lhs] = getFirstSet(lhs, rules)
	for f in first_dict:
		print "\t"+str(f) + " : " + str(first_dict[f])
	print ""
	
	print '\nFollow Set\n'
	for lhs in rules:
		follow_dict[lhs] = set()

	follow_dict[start] = follow_dict[start].union('$')

	for lhs in rules:
		follow_dict = getFollowSet(lhs, rules, follow_dict)

	for f in follow_dict:
		print "\t"+str(f) + " : " + str(follow_dict[f])

	parsingTable(follow_dict, rules)