require(dplyr)
require(tidyr)
require(ggplot2)

stack = read.csv('eurovision_2021_scores.csv')
  
# plot jury vs public - summarise and pivot at the same time

stack %>% group_by(performing_country) %>%
  summarise(jury_points = sum(ifelse(voting_type == 'jury', points_awarded, 0)),
           public_points = sum(ifelse(voting_type == 'public', points_awarded, 0)),
           ) %>% 
  ggplot(aes(jury_points, public_points,
             color = ifelse(jury_points > 150 | public_points > 150, performing_country, ''))) +
  geom_point() + 
  geom_abline(linetype = 2, colour = 'grey') +
  geom_text(aes(label=ifelse(jury_points > 150 | public_points > 150, performing_country, '')),
            hjust = 1.1, col = 'black') + 
  scale_colour_manual(values = c('black', rainbow(8))) + 
  ylab('Total Public Points\n') + xlab('\nTotal Jury Points') +
  theme_minimal() + 
  theme(text = element_text(size = 16),
        legend.position = 'none')

# violin plot of average scores

stack %>% 
  filter(performing_country != voting_country) %>% 
  ggplot(aes(1, points_awarded, fill = voting_type)) + 
  geom_violin() + 
  scale_y_continuous(breaks = c(0:12), labels = c(0:8,'',10,'',12)) +
  scale_x_discrete(labels = '') + 
  scale_fill_manual(values = c('purple2', 'orange')) +
  ylab('Points Awarded') + xlab('') + labs(fill = '') + 
  geom_jitter(height = 0, color = 'black', size = 1) + 
  facet_wrap(performing_country ~ .) + 
  theme_minimal() + 
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    legend.position = 'bottom'
  )
  








  