
# Raw File [_Click Google Sheet Link_](https://docs.google.com/spreadsheets/d/1Ce5JC_SB4egrqAwZfQ6sO68dKDcyqHWvU8P3QtsGSH4/edit?usp=sharing)

This project come from practice made by Data Rockie School.

website https://data-science-bootcamp1.teachable.com/

Thanks for the practice.

# about This practice

## we will make analysis report from 'Full Dataset' sheet that combined from 'FreeFire' and 'PubG' sheet.
### create new columns for more metrics for use analysis by multples formula.
- 'Total Enagagement' column by =SUM() from 'Likes', 'Reactions', 'Comments' and 'Post shares' column
- 'Length Message' column by =LEN() >>> with 'Message' column
- 'Segment Lenght Message' column by =IFS() >>> from 'Length Message' column with 3 conditions (Low, Medium, High)
- 'Content Type' column by =IF( REGEXMATCH()) >>> for segment 3 content with text contains from 'Message' column
- 'Month' column by =MONTH() with 'Create date' column >>> for extract Month data
- 'Day Type' column by =IF( WEEKDAY()) with 'Create date' >>> for segment date to WeekDay or WeekEnd
- 'Week' column manaul input week 1-4 for each months


### Then use Pivot Table or =Query( ) formula and Conditionals Formatting.
### build Analysis Chart and Table reports >>> for answers with many questions as below.
- Which posts and type of post is the best engagement?
- What is top 5 post Shared?
- What time is brand often post?
- The audiences would like to read with long message post or not?
- How many posts is segment to Promotion post?
- What is relationship between 'Likes' and 'Shares' performance?
- Please segmentation post to 'promotion', 'news' and 'update patch game'
- What about weekly and monthly engagement performance?
- What about engagement performance between Weekday vs Weekend?
