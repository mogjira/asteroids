#ifndef R_PIPELINE_H
#define R_PIPELINE_H

#include "r_render.h"

extern VkPipeline pipelines[MAX_PIPELINES];

void initDescriptorSets(void);
void initPipelines(void);

void cleanUpPipelines(void);

#endif /* end of include guard: R_PIPELINE_H */
