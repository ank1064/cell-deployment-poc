{{/*
  Cell identity is taken directly from the Helm release name set by Harness.
  Each Harness stage overrides the infra's releaseName, so .Release.Name differs per cell:
    Cell Default -> release-default
    Cell X       -> release-cell-x
    Cell 0       -> release-cell-0
  No per-stage Helm values override is needed.
*/}}

{{- define "cell-poc.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cell-poc.cell" -}}
{{- /* Strip the leading "release-" prefix to get the cell name */ -}}
{{- .Release.Name | trimPrefix "release-" -}}
{{- end -}}

{{- define "cell-poc.labels" -}}
app.kubernetes.io/name: cell-poc
app.kubernetes.io/instance: {{ include "cell-poc.fullname" . }}
cell: {{ include "cell-poc.cell" . | quote }}
{{- end -}}
