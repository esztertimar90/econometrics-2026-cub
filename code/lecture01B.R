# ------------------------------------------------------------------------------
# Coding basics in R: data viz
# based on
#   - Ágoston Reguly, Gábor Békés: Introduction to Data Analysis with R - lecture materials
#   - Rafael Irizarry: Introduction to Data Science: Data Wrangling and Visualization with R

# Edited using Positron by E. Timár
# ------------------------------------------------------------------------------

## 2) Basic data visualization case study: CEO salary ---------------------------------------------------
rm(list = ls()) #cleans the environment

# Story: What's the connection between CEO salary and ROE?
# load CEO salary dataset
ceo <- ceosal1 # built-in data from wooldridge package

# first look on the data
str(ceo) # glance at data structure
head(ceo) # first five rows
view(ceo) # whole data

# visualisation in tidyverse
  # simple scatter plot about ceo salary and roe
  ggplot(data = ceo,
         mapping = aes(y = salary,
                       x = roe)) +
    geom_point()
  
  # save "main settings" - assign the graph to an object
  roe_salary_plot <- ggplot(data = ceo,
                            mapping = aes(y = salary,
                                          x = roe))
  
  # add a scatter plot and linear line to the main settings
  roe_salary_plot +
    geom_point() +
    geom_smooth(method = lm)
  
  # check which observations are outliers (over 99. percentile) by salary
    # plot the distribution of the salary
    ggplot(data = ceo,
           mapping = aes(x = salary)) +
      geom_histogram(binwidth = 100) +
      scale_x_continuous(breaks = seq(0, 15000, by = 3000))
    
    quantile(ceo$salary, probs = 0.99)
  
  # drop outliers, by salary
  cutoff <- quantile(ceo$salary, probs = 0.99)
  ceo <- ceo[ceo$salary < cutoff, ]
  
  # how to use with
  # generate industry variable
  ceo$industry <- factor(with(ceo, ifelse(indus == 1, 'industrial',
                                        ifelse(finance == 1, 'financial',
                                               ifelse(consprod == 1, 'consumer products', 'transport and utility')))))
  
  # we have to save main settings again as data has changed
  roe_salary_plot <- ggplot(data = ceo,
                            mapping = aes(y = salary,
                                          x = roe))
  # colour by industry
  roe_salary_plot +
    aes(colour = industry) +
    geom_point() +
    geom_smooth(method = lm)
  
  # colour only points
  roe_salary_plot +
    geom_point(mapping = aes(colour = industry)) +
    geom_smooth(method = lm)
  
  # colour only points but add new color to the line
  roe_salary_plot +
    geom_point(mapping = aes(colour = industry)) +
    geom_smooth(method = lm,
                colour = 'black')
  
  # add labels
  roe_salary_plot +
    geom_point(mapping = aes(colour = industry)) +
    geom_smooth(method = lm,
                colour = 'black') +
    labs(y = 'Salary ($1000)',
         x = 'ROE',
         color = 'Industry')
  
  # make the plot more fancy using AI
  roe_salary_figuresave <- roe_salary_plot +
    geom_point(mapping = aes(colour = industry),
               size = 3,
               alpha = 0.7) +
    geom_smooth(method = lm,
                colour = 'black',
                linetype = 'dashed',
                linewidth = 1) +
    labs(title = 'CEO Salary vs. Return on Equity (ROE)',
         y = 'Salary ($1000)',
         x = 'ROE (%)',
         color = '') +
    theme_minimal() +
    theme(text = element_text(size = 14),
          plot.title = element_text(hjust = 0.5, face = 'bold', size = 16),
          plot.subtitle = element_text(hjust = 0.5, size = 12),
          legend.position = 'top') +
    scale_color_brewer(palette = 'Set1') +
    scale_x_continuous(breaks = seq(-20, 80, by = 10)) +
    scale_y_continuous(breaks = seq(0, 6000, by = 500))

