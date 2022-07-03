#!/bin/sh -e
#
# usage: parse_pnp.sh < pnp.ids.xlsx > pnp.ids

sed -e 's/<tbody>/\n/' \
    -e 's/\&amp;/\&/g' \
    -e "s/\&#039;/'/g" \
    -e 's/ / /g' |

# <tr class="even"><td>OZO Co.Ltd</td><td>OZD</td><td>06/17/2022</td> </tr>
#               vendor ^^^^^^^^^^      id ^^^
while IFS='<>' read -r _ _ _ _ vendor _ _ _ id _; do
    [ -n "$vendor" ] || continue
    printf "${id% }\t$vendor\n"
done | sort
