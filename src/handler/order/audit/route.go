package audit

import "github.com/cookieY/yee"

func AuditRestFulAPis() yee.RestfulAPI {
	return yee.RestfulAPI{
		Get:  AuditFetchApis,
		Post: AuditOrderApis,
		Put:  AuditOrRecordOrderFetchApis,
	}
}
