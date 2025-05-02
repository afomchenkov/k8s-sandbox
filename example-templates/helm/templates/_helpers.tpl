{{- define "mychart.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "mychart.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{- define "mychart.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{- define "mychart.labels" -}}
app: {{ include "mychart.name" . }}

chart: {{ include "mychart.chart" . }}

release: {{ .Release.Name }}

heritage: {{ .Release.Service }}

{{- end }}
