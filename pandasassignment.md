  Pandas Assignment


Q1. How do you load a CSV file into a Pandas DataFrame?
Ans. CSV files (comma separated files) are simple way to store big datasets. read_table() and read_csv are the important pandas function to read csv files and create data frame from it.

import pandas as pd
# Method-i
df = pd.read_csv("data.csv")
df
# Method-ii
ds = pd.read_table("data.csv")
ds


Q2. How do you check the data type of a column in a Pandas DataFrame?
Ans. To check the data type in pandas DataFrame we can use the “dtype” attribute. The attribute returns a series with the data type of each column.

# syntax
For a single column: dataframe.column_name.dtype 
For all columns: dataframe.dtypes


Q3. How do you select rows from a Pandas DataFrame based on a condition?
Ans.

Q4. How do you rename columns in a Pandas DataFrame?
Ans. One way of renaming the columns in a Pandas Dataframe is by using the rename() function. This method is quite useful when we need to rename some selected columns.
# syntax
dataFrame.rename(columns={'oldName1': 'newName1', 'oldName2': 'newName2'})


Q5. How do you drop columns in a Pandas DataFrame?
Ans. The drop() method removes the specified row or column.
# syntax
df = dataframe.drop('column_name', axis=1)
where 1 is the axis number (0 for rows and 1 for columns.)
To delete the column without reassign df is:
df.drop('column_name', axis=1, inplace=True)


Q6. How do you find the unique values in a column of a Pandas DataFrame?
Ans. You can get unique values in column (multiple columns) from pandas DataFrame using unique() method.
# syntax
dataframe['column_name'].unique()

Q7. How do you find the number of missing values in each column of a Pandas DataFrame?
Ans. Count NaN or missing values in Pandas DataFrame using isnull() and sum() method of the DataFrame. Pandas isnull() function detect missing values in the given object.
# Syntax
DataFrame.isnull()

Q8. How do you fill missing values in a Pandas DataFrame with a specific value?
Ans. To replace missing values (NaN) in Pandas DataFrame, use the fillna() method. 
# Syntax
dataframe.fillna(value, method, axis, inplace, limit, downcast)

  value: Specifies the value to replace the NULL values with.
         This can also be values for the entire row or column.
  method:	Specifies the method to use when replacing ('backfill', 'bfill', 'pad','ffill', None(default)). 
  axis:	default 0. The axis to fill the NULL values along
  inplace: default False. If True: the replacing is done on the current DataFrame.
           If False: returns a copy where the replacing is done.
  limit:	default None. Specifies the maximum number of NULL values to fill (if method is specified)
  downcast:	A dictionary of values to fill for specific data types

Q9. How do you concatenate two Pandas DataFrames?
Ans. A concatenation of two or more data frames can be done using pandas.concat() method. 
concat() in pandas works by combining Data Frames across rows or columns.
Use axis=0 to concat along rows, axis=1 to concat along columns.

Q10. How do you merge two Pandas DataFrames on a specific column?
Ans. Pandas merge() function is used to merge multiple Dataframes. 
We can use either pandas.merge() or DataFrame.merge() to merge multiple Dataframes. 

Q11. How do you group data in a Pandas DataFrame by a specific column and apply an aggregation function?
Ans. Dataframe.aggregate() function is used to apply some aggregation across one or more column.

Q12. How do you pivot a Pandas DataFrame?
Ans. The pivot() function is used to reshaped a given DataFrame organized by given index / column values. 
# Syntax
dataFrame.pivot(self, index=None, columns=None, values=None)
Parameters –
  index: Column for making new frame’s index. If None, uses existing index.
  columns: Column for new frame’s columns.
  values: Column(s) for populating new frame’s values. If not specified, all remaining columns will be used and the result will have hierarchically indexed columns.

Q13. How do you change the data type of a column in a Pandas DataFrame?
Ans. There are different ways of changing DataType for one or more columns in Pandas Dataframe.
DataFrame.astype() method is used to cast pandas object to a specified dtype.

Q14. How do you sort a Pandas DataFrame by a specific column?
Ans.To sort the DataFrame based on the values in a single column, you’ll use .sort_values(). By default, this will return a new DataFrame sorted in ascending order. 
# Syntax 
DataFrame.sort_values(by, axis=0, ascending=True, inplace=False, kind=’quicksort’, na_position=’last’)

This method will take following parameters :
  by: Single/List of column names to sort Data Frame by.

  axis: 0 or ‘index’ for rows and 1 or ‘columns’ for Column.

  ascending: Boolean value which sorts Data frame in ascending order if True.

  inplace: Boolean value. Makes the changes in passed data frame itself if True.

  kind: String which can have three inputs(‘quicksort’, ‘mergesort’ or ‘heapsort’) of the algorithm used to sort data frame.

  na_position: Takes two string input ‘last’ or ‘first’ to set position of Null values. Default is ‘last’.

Q15. How do you create a copy of a Pandas DataFrame?
Ans. The copy() method returns a copy of the DataFrame.
# Syntax
dataframe.copy(deep)
Parameter:
  Deep:	Optional. Specifies whether to make a deep or a shallow copy. By default (deep=True, any changes made in the original DataFrame will not be reflected in the copy.
  deep=False, it is only the reference to the data (and index) that will be copied, and any changes made in the original will be reflected in the copy, and, any changes made in the copy will be reflected in the original.

Q16. How do you filter rows of a Pandas DataFrame by multiple conditions?
Ans. By using df[], loc[], query(), eval() and numpy.where() we can filter Pandas DataFrame by multiple conditions.

Q17. How do you calculate the mean of a column in a Pandas DataFrame?
Ans. Pandas dataframe.mean() function return the mean of the values for the requested axis.
# Syntax 
 DataFrame.mean(axis=None, skipna=None, level=None, numeric_only=None, **kwargs)

Parameters :
  axis : {index (0), columns (1)}
  skipna : Exclude NA/null values when computing the result
  level : If the axis is a MultiIndex (hierarchical), count along a particular level, collapsing into a Series
  numeric_only : Include only float, int, boolean columns. If None, will attempt to use everything, then use only numeric data. Not implemented for Series.

Q18. How do you calculate the standard deviation of a column in a Pandas DataFrame?
Ans. DataFrame.std() function to calculate the standard deviation of values in a pandas DataFrame.
  Calculate Standard Deviation of All Numeric Columns: df.std() 
  Calculate Standard Deviation of One Column: df['column_name'].std()
  Calculate Standard Deviation of Multiple Columns: df[['column_name1','column_name2']].std() 

Q19. How do you calculate the correlation between two columns in a Pandas DataFrame?
Ans. Pandas dataframe.corr() is used to find the pairwise correlation of all columns in the Pandas Dataframe in Python. Any NaN values are automatically excluded. Any non-numeric data type or columns in the Dataframe, it is ignored.
# Syntax 
DataFrame.corr(self, method=’pearson’, min_periods=1) 

Parameters: 
  method : 
    pearson: standard correlation coefficient 
    kendall: Kendall Tau correlation coefficient 
    spearman: Spearman rank correlation
  min_periods : Minimum number of observations required per pair of columns to have a valid result. Currently only available for pearson and spearman correlation 

Q20. How do you select specific columns in a DataFrame using their labels?
Ans. The basic way to select a single column from a dataframe, just put the string name of the column in brackets[], df['columnname']
Passing a list in the brackets lets you select multiple columns at the same time, df['columnname1','columnname2','columnname3']
The .loc[] function selects the data by labels of rows or columns.
  To select single column: df.loc[['columnname']]
  To select multiple columns: df.loc[['columnname1','columnname2','columnname3']]
  To select all rows and particular list of columns: df.loc[:,['columnname1','columnname2','columnname3']] 

Q21. How do you select specific rows in a DataFrame using their indexes?
Ans. One can select a single row from pandas DataFrame by integer index using df.iloc[r]. Replace r with a position you wanted to select.
Multiple rows from DataFrame can be selected by specifying indexes as a list. You can do this by df.iloc[[r1,r2,r3]]. r1,r2,r3 are indices.
DataFrame can be selected by the range of Indexes, provide start and stop indexes, df.iloc[startindex:stopindex]

Q22. How do you sort a DataFrame by a specific column?
Ans. To sort the DataFrame based on the values in a single column, you’ll use .sort_values(). By default, this will return a new DataFrame sorted in ascending order. 
# Syntax 
DataFrame.sort_values(by, axis=0, ascending=True, inplace=False, kind=’quicksort’, na_position=’last’)

This method will take following parameters :
  by: Single/List of column names to sort Data Frame by.

  axis: 0 or ‘index’ for rows and 1 or ‘columns’ for Column.

  ascending: Boolean value which sorts Data frame in ascending order if True.

  inplace: Boolean value. Makes the changes in passed data frame itself if True.

  kind: String which can have three inputs(‘quicksort’, ‘mergesort’ or ‘heapsort’) of the algorithm used to sort data frame.

  na_position: Takes two string input ‘last’ or ‘first’ to set position of Null values. Default is ‘last’.

Q23. How do you create a new column in a DataFrame based on the values of another column?
Ans. One can add/append a new column to the DataFrame based on the values of another column using
      1. df.assign()
      2. df.apply()
      3. By directly performing arithmetic operations on existing columns and assign the result as a new column to DataFrame.
      4. df.map()

Q24. How do you remove duplicates from a DataFrame?
Ans. Pandas drop_duplicates() method helps in removing duplicates from the Pandas Dataframe In Python.
# Syntax 
DataFrame.drop_duplicates(subset=None, keep=’first’, inplace=False)

Parameters:

  subset: Subset takes a column or list of column label. It’s default value is none. After passing columns, it will consider them only for duplicates.

  keep: keep is to control how to consider duplicate value. It has only three distinct value and default is ‘first’. 
    If ‘first‘, it considers first value as unique and rest of the same values as duplicate.
    If ‘last‘, it considers last value as unique and rest of the same values as duplicate.
    If False, it consider all of the same values as duplicates

  inplace: Boolean values, removes rows with duplicates if True.

Q25. What is the difference between .loc and .iloc in Pandas?
Ans. They are used for slicing data from the Pandas DataFrame.  They are used in filtering the data according to some conditions. 
The .loc() function is label based data selecting method which means that we have to pass the name of the row or column which we want to select. 
The iloc() function is an indexed-based selecting method which means that we have to pass an integer index in the method to select a specific row/column. 
iloc() does not include the last element of the range passed in it, unlike .loc()