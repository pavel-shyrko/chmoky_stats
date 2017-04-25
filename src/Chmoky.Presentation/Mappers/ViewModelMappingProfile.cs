using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;

namespace Chmoky.Presentation.Mappers
{
    public class ViewModelMappingProfile : Profile
    {
        public ViewModelMappingProfile()
        {
            CreateMap<DataAccess.GetStatistics_Result, Models.TopRecordModel>()
                .ForMember(dest => dest.Author, opt => opt.MapFrom(src => new Models.AuthorModel
                {
                    FullName = string.Format("{0} {1}", src.FirstName, src.LastName),
                    SkypeID = src.author,
                    SkypeNames = src.DispName.Replace(",", "<br />")
                }))
                .ForMember(dest => dest.total, opt => opt.MapFrom(src => src.total_just_text))
                .ForMember(dest => dest.min, opt => opt.MapFrom(src => src.min_just_text))
                .ForMember(dest => dest.max, opt => opt.MapFrom(src => src.max_just_text))
                .ForMember(dest => dest.avg, opt => opt.MapFrom(src => src.avg_just_text));

            CreateMap<DataAccess.GetMessages_Result, Models.MessageRecordModel>()
                .ForMember(dest => dest.timestamp, opt => opt.MapFrom(src => src.timestamp.HasValue
                                ? src.timestamp.Value.ToLocalTime()
                                : (DateTime?)null))
                .ForMember(dest => dest.text, opt => opt.MapFrom(src => src.just_html_text))
                .ForMember(dest => dest.len, opt => opt.MapFrom(src => src.len_just_text))
                .ForMember(dest => dest.Author, opt => opt.MapFrom(src => new Models.AuthorModel
                {
                    FullName = string.Format("{0} {1}", src.FirstName, src.LastName),
                    SkypeID = src.author,
                    SkypeNames = src.DispName.Replace(",", "<br />")
                }));

            CreateMap<DataAccess.FindAuthor_Result, Models.AuthorModel>()
                .ForMember(dest => dest.FullName, opt => opt.MapFrom(src => string.Format("{0} {1}", src.FirstName, src.LastName)));
        }
    }
}