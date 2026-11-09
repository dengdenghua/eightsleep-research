/* Analyst reconstruction from Thumb, NOT recovered original source.
 * Target SHA256: 6946c6bf1de0cd762dcf77a6eef1758b8a5a1774f28f33cab104f4a0e57ee891
 * Static reasoning only; not compiled or executed; deployment not established.
 * Focus: main 0x0801953c -> packer 0x08017f70.
 */
#include <stdint.h>
struct Channel { float *ring; uint32_t length, position; float sum; };
struct Output { uint32_t timestamp; int32_t adc[2][8]; };

/* At process initialization: 16 Channel objects, 5 zero floats per ring,
 * length=5, position=0, sum=0; time_pos=0, decimation_count=0.
 * Raw acquisition before this function includes per-ADC DRDY, cache reuse,
 * SPI-read success, channel-available mask, and signed 24-bit conversion.
 */
void accepted_adc_pair(int32_t x[2][8], uint32_t now,
                      struct Channel c[2][8], uint32_t timestamps[5],
                      uint8_t *time_pos, uint8_t *decimation_count) {
    for (unsigned a=0; a<2; a++) for (unsigned k=0; k<8; k++) {
        struct Channel *s=&c[a][k];
        float sample=(float)x[a][k];
        s->sum=s->sum+(sample-s->ring[s->position]);
        s->ring[s->position]=sample;
        s->position=(s->position+1 < s->length) ? s->position+1 : 0;
    }
    timestamps[*time_pos]=now;
    *time_pos=(*time_pos+1)%5;
    if (++*decimation_count == 5) {
        *decimation_count=0;
        struct Output o;
        o.timestamp=timestamps[*time_pos]; /* earliest accepted frame in group */
        for (unsigned a=0; a<2; a++) for (unsigned k=0; k<8; k++)
            o.adc[a][k]=(int32_t)(c[a][k].sum/(float)c[a][k].length);
        /* push into 30-slot, 68-byte-per-entry queue; count a failed push */
    }
    /* when queue_count >14: pack up to15 entries:
     * 5c,01,BE16(500/5),02,08,N,BE32(first.timestamp),
     * then N * 2 * 8 * BE32(processed integer sample).
     */
}
