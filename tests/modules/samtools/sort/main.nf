#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { SAMTOOLS_SORT } from '../../../../modules/samtools/sort/main.nf'
include { SAMTOOLS_SORT as SAMTOOLS_SORT_CSI } from '../../../../modules/samtools/sort/main.nf'

workflow test_samtools_sort  {
    input = [ [ id:'test', single_end:false ], // meta map
                file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true)
            ]

    SAMTOOLS_SORT ( input )
}

workflow test_samtools_sort_csi  {
    input = [ [ id:'test', single_end:false ], // meta map
                file(params.test_data['sarscov2']['illumina']['test_paired_end_bam'], checkIfExists: true)
            ]

    SAMTOOLS_SORT_CSI ( input )
}
