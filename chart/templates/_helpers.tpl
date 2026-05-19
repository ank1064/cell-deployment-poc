{{/* Generate base name suffixed by cell so each cell gets unique k8s object names */}}
{{- define "cell-poc.fullname" -}}
{{- printf "cell-poc-%s" .Values.cell | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cell-poc.labels" -}}
app.kubernetes.io/name: cell-poc
app.kubernetes.io/instance: {{ include "cell-poc.fullname" . }}
cell: {{ .Values.cell | quote }}
{{- end -}}
