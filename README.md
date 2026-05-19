# cell-deployment-poc

Lightweight Helm chart used to validate Harness **cell-based deployment** architecture in `nglabs/CSETest1`.

The chart deploys a tiny nginx pod plus a ConfigMap. The `cell` value is overridden by the Harness pipeline per stage:

| Cell | Helm value | Release name |
|---|---|---|
| Cell Default | `cell=default` | `cell-poc-default` |
| Cell X | `cell=cell-x` | `cell-poc-cell-x` |
| Cell 0 | `cell=cell-0` | `cell-poc-cell-0` |

All three cells run in the **same cluster + namespace** using the **same infrastructure definition**. Independent release names per stage prevent Harness from garbage-collecting another cell's resources.
